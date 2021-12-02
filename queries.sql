/*Queries that provide answers to the questions from all projects.*/

SELECT * 
FROM animals 
WHERE name LIKE '%mon';

SELECT name
FROM animals
WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

SELECT name
FROM animals
WHERE neutered = true AND escape_attempts < 3;

SELECT date_of_birth
FROM animals
WHERE name IN ('Agumon', 'Pikachu');

SELECT name, escape_attempts
FROM animals
WHERE weight_kg > 10.5;

SELECT *
FROM animals
WHERE neutered = true;

SELECT *
FROM animals
WHERE name NOT IN ('Gabumon');

SELECT *
FROM animals
WHERE weight_kg BETWEEN 10.4 AND 17.3;

SELECT COUNT(*) FROM animals;

SELECT COUNT(*) FROM animals
WHERE escape_attempts = 0;

SELECT AVG(weight_kg) FROM animals;

SELECT SUM(escape_attempts) FROM animals
GROUP BY neutered;

SELECT MIN(weight_kg), MAX(weight_kg) FROM animals
GROUP BY species;

SELECT AVG(escape_attempts) FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY species;

SELECT *
FROM animals
INNER JOIN owners
ON owner_id = owners.id
WHERE owners.full_name = 'Melody Pond';

SELECT *
FROM animals
INNER JOIN species
ON species_id = species.id
WHERE species.name = 'Pokemon';

SELECT *
FROM owners
LEFT JOIN animals
ON owners.id = animals.owner_id;

SELECT species.name, COUNT(*)
FROM animals
INNER JOIN species
ON species_id = species.id
GROUP BY species.id;

SELECT animals.name, owners.full_name, species.name
FROM animals
INNER JOIN owners ON owner_id = owners.id
INNER JOIN species ON species_id = species.id
WHERE owners.full_name = 'Jennifer Orwell'
AND species.name = 'Digimon';

SELECT animals.name, animals.escape_attempts, owners.full_name
FROM animals
INNER JOIN owners ON owner_id = owners.id
WHERE owners.full_name = 'Dean Winchester'
AND animals.escape_attempts = 0;

SELECT owners.full_name, COUNT(animals.owner_id)
FROM animals
FULL JOIN owners
ON animals.owner_id = owners.id
GROUP BY owners.id;
