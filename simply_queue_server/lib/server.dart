import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:serverpod/serverpod.dart';

import 'src/generated/protocol.dart';
import 'src/generated/endpoints.dart';

import 'src/endpoints/store_endpoint.dart' as scope;

import 'package:serverpod_auth_server/serverpod_auth_server.dart' as auth;

import 'src/web/routes/root.dart';

// This is the starting point of your Serverpod server. In most cases, you will
// only need to make additions to this file if you add future calls,  are
// configuring Relic (Serverpod's web-server), or need custom setup work.

void run(List<String> args) async {
  // Initialize Serverpod and connect it with your generated code.
  final pod = Serverpod(
    args,
    Protocol(),
    Endpoints(),
    authenticationHandler: auth.authenticationHandler,
  );

  // If you are using any future calls, they need to be registered here.
  // pod.registerFutureCall(ExampleFutureCall(), 'exampleFutureCall');

  // add auth config
  auth.AuthConfig.set(auth.AuthConfig(
    sendValidationEmail: (session, email, validationCode) async {
      print('Validation code: $validationCode');
      session.log('Code for $email is $validationCode');

      return true;

      // send mail
      // final subject = 'Verfify your account';
      // final body = 'Hi,\nYour validation code = $validationCode';

      // return await sendMail(session, email, subject, body);
    },
    sendPasswordResetEmail: (session, userInfo, validationCode) async {
      print('Validation code: $validationCode');
      session.log('Code for ${userInfo.userName} is $validationCode');

      return true;

      // send mail
      // final subject = 'Reset your account';
      // final body = 'Hi,\nYour validation code = $validationCode';

      // return await sendMail(session, userInfo.email!, subject, body);
    },
  ));

  // Setup a default page at the web root.
  pod.webServer.addRoute(RouteRoot(), '/');
  pod.webServer.addRoute(RouteRoot(), '/index.html');
  // Serve all files in the /static directory.
  pod.webServer.addRoute(
    RouteStaticDirectory(serverDirectory: 'static', basePath: '/'),
    '/*',
  );

  // Start the server.
  await pod.start();

  // init sample data
  await initSampleData(pod);
}

Future<bool> sendMail(
    Session session, String email, String subject, String body) async {
  // Retrieve the credentials
  final gmailAccount = session.serverpod.getPassword('gmailAccount')!;
  final gmailAppPassword = session.serverpod.getPassword('gmailAppPassword')!;

  // Create a SMTP client for Gmail.
  final smtpServer = gmail(gmailAccount, gmailAppPassword);

  // Create an email message with the validation code.
  final message = Message()
    ..from = Address(gmailAccount)
    ..recipients.add(email)
    ..subject = subject
    ..html = body;

  // Send the email message.
  try {
    await send(message, smtpServer);
    return true;
  } catch (_) {
    // Return false if the email could not be sent.
    return false;
  }
}

Future<void> initSampleData(Serverpod pod) async {
  final session = await pod.createSession();

  // add sample user
  final totalUser = await auth.UserInfo.db.count(session);
  if (totalUser == 0) {
    session.log('No user! add sample user');

    await auth.Emails.createUser(
      session,
      'customer',
      'customer@example.com',
      'Hello123!',
    ).then((user) async {
      await auth.Users.updateUserScopes(
        session,
        user!.id!,
        {scope.UserScope.customer},
      );
      session.log('Add customer account');
    });

    await auth.Emails.createUser(
      session,
      'store',
      'store@example.com',
      'Hello123!',
    ).then((user) async {
      await auth.Users.updateUserScopes(
        session,
        user!.id!,
        {scope.UserScope.store},
      );
      session.log('Add store account');
    });
  }

  // add sample store
  final totalStore = await Store.db.count(session);
  if (totalStore == 0) {
    session.log('No store! add sample store');

    final store = Store(
      name: 'Sample Store',
      description:
          'Do commodo ullamco Lorem veniam est cupidatat quis amet sint.',
      image: 'https://picsum.photos/536/354',
      createdAt: DateTime.now(),
      currentQueue: 0,
    );

    await Store.db.insertRow(session, store);
  }
}
