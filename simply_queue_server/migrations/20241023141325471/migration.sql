BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "queue" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "queue" (
    "id" bigserial PRIMARY KEY,
    "number" bigint NOT NULL,
    "userInfoId" bigint NOT NULL,
    "storeId" bigint NOT NULL,
    "status" text NOT NULL DEFAULT 'wait'::text,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

--
-- ACTION DROP TABLE
--
DROP TABLE "store" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "store" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "description" text NOT NULL,
    "image" text NOT NULL,
    "currentQueue" bigint NOT NULL DEFAULT 0,
    "userInfoId" bigint NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "queue"
    ADD CONSTRAINT "queue_fk_0"
    FOREIGN KEY("userInfoId")
    REFERENCES "serverpod_user_info"("id")
    ON DELETE SET NULL
    ON UPDATE SET NULL;
ALTER TABLE ONLY "queue"
    ADD CONSTRAINT "queue_fk_1"
    FOREIGN KEY("storeId")
    REFERENCES "store"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "store"
    ADD CONSTRAINT "store_fk_0"
    FOREIGN KEY("userInfoId")
    REFERENCES "serverpod_user_info"("id")
    ON DELETE SET NULL
    ON UPDATE SET NULL;


--
-- MIGRATION VERSION FOR simply_queue
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('simply_queue', '20241023141325471', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20241023141325471', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth', '20240520102713718', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240520102713718', "timestamp" = now();


COMMIT;
