-- CreateTable
CREATE TABLE "public"."Job" (
    "id" SERIAL NOT NULL,
    "site" TEXT NOT NULL,
    "material" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Job_pkey" PRIMARY KEY ("id")
);
