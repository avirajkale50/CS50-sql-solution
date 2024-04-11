CREATE INDEX "search_enrollments" ON "enrollments" ("student_id");

CREATE INDEX "search_enrollments_course" ON "enrollments" ("course_id");

CREATE INDEX "search_course_dept" ON "courses" ("department");

CREATE INDEX "search_course_sem" ON "courses" ("semester");

CREATE INDEX "search_satisfies_course" ON "satisfies" ("course_id");


