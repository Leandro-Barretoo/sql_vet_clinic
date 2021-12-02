/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(
  id              INT GENERATED ALWAYS AS IDENTITY,
  name            VARCHAR(20),
  date_of_birth   DATE,
  escape_attempts INT,
  neutered        BOOLEAN,
  weight_kg       DECIMAL(10, 3),
  PRIMARY KEY(id)
);

ALTER TABLE animals
ADD species VARCHAR(255);

CREATE TABLE owners(
  id          INT GENERATED ALWAYS AS IDENTITY,
  full_name   VARCHAR(255),
  age         INT
);

CREATE TABLE species(
  id     INT GENERATED ALWAYS AS IDENTITY,
  name   VARCHAR(255)
);

ALTER TABLE animals
DROP COLUMN species;

ALTER TABLE animals
ADD species_id INT;

ALTER TABLE species
ADD PRIMARY KEY(id);

ALTER TABLE animals
ADD CONSTRAINT species_fk
FOREIGN KEY(species_id)
REFERENCES species(id)
ON DELETE CASCADE;

ALTER TABLE animals
ADD owner_id INT;

ALTER TABLE owners
ADD PRIMARY KEY(id);

ALTER TABLE animals
ADD CONSTRAINT owner_fk
FOREIGN KEY(owner_id)
REFERENCES owners(id)
ON DELETE CASCADE;

CREATE TABLE vets(
  id                 INT GENERATED ALWAYS AS IDENTITY,
  name               VARCHAR(255),
  age                INT,
  date_of_graduation DATE,
  PRIMARY KEY(id) 
);

CREATE TABLE specializations(
  vets_id INT,
  species_id INT,
  CONSTRAINT fk_vets
    FOREIGN KEY(vets_id)
      REFERENCES vets(id),
  CONSTRAINT fk_species
    FOREIGN KEY(species_id)
      REFERENCES species(id)
);

CREATE TABLE visits(
  vets_id INT,
  animals_id INT,
  CONSTRAINT fk_vets
    FOREIGN KEY(vets_id)
      REFERENCES vets(id),
  CONSTRAINT fk_animals
    FOREIGN KEY(animals_id)
      REFERENCES animals(id)
);
