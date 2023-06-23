DROP DATABASE IF EXISTS medical_stuff;

CREATE DATABASE medical_stuff;

\c medical_stuff;

CREATE TABLE medical_centers
  (id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  address TEXT NOT NULL);

CREATE TABLE doctors
  (id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  med_id INTEGER REFERENCES medical_centers,
  specialty TEXT DEFAULT 'General Practitioner');

CREATE TABLE patients
  (id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  insurance TEXT DEFAULT 'Uninsured');

CREATE TABLE diagnosis
  (id SERIAL PRIMARY KEY,
  diagnosis TEXT DEFAULT 'Unclear diagnosis');

CREATE TABLE visit
  (id SERIAL PRIMARY KEY,
  date DATE NOT NULL,
  patient_id INTEGER REFERENCES patients,
  doctor_id INTEGER REFERENCES doctors,
  diagnosis_id INTEGER REFERENCES diagnosis);

INSERT INTO medical_centers
  (name, address)
  VALUES
  ('Reston Hospital', '123 Somewhere Lane Reston, VA 18355'),
  ('Richmond Hospital', '756 Address Boulevard, VA 15344'),
  ('Herndon Hospital', '295 Example Drive Herndon, VA 11141');

INSERT INTO doctors
  (name, med_id, specialty)
  VALUES
  ('Doctor A', 1, 'Cardiologist'),
  ('Doctor B', 2, 'Neurologist'),
  ('Doctor C', 3, 'Oncologist');

INSERT INTO patients
  (name, insurance)
  VALUES
  ('Patient A', 'Aflac'),
  ('Patient B', 'USAA'),
  ('Patient C', 'Blue Shield');

INSERT INTO diagnosis
  (diagnosis)
  VALUES
  ('Arrhythmia'),
  ('Dementia'),
  ('Leukemia');

INSERT INTO visit
  (date, patient_id, doctor_id, diagnosis_id)
  VALUES
  ('2021-05-19', 1, 1, 1),
  ('2022-01-13', 2, 2, 2),
  ('2023-08-10', 3, 3, 3);