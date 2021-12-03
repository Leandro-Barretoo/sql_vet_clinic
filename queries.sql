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

SELECT animals.name, visits.visit_date
FROM visits
JOIN vets ON vets.id = visits.vets_id
JOIN animals ON animals.id = visits.animals_id
WHERE vets.name = 'William Tatcher'
GROUP BY animals.name, visits.visit_date
ORDER BY visits.visit_date DESC LIMIT 1;

SELECT COUNT(DISTINCT animals_id) FROM visits
INNER JOIN vets ON vets.id = visits.vets_id
WHERE vets.name = 'Stephanie Mendez';

SELECT vets.name, species.name FROM specializations
INNER JOIN species ON species.id = specializations.species_id
FULL JOIN vets ON vets.id = specializations.vets_id;

SELECT animals.name, vets.name, visit_date FROM visits
INNER JOIN animals ON visits.animals_id = animals.id
INNER JOIN vets ON visits.vets_id = vets.id
WHERE visit_date BETWEEN '2020-04-01' AND '2020-08-30'
AND vets.name = 'Stephanie Mendez';

SELECT animals.name, COUNT(visits.animals_id) FROM visits
INNER JOIN animals ON visits.animals_id = animals.id
GROUP BY animals.name
ORDER BY count DESC LIMIT 1;

SELECT animals.name, vets.name, visit_date FROM visits
INNER JOIN animals ON visits.animals_id = animals.id
INNER JOIN vets ON visits.vets_id = vets.id
WHERE vets.name = 'Maisy Smith'
ORDER BY visit_date ASC LIMIT 1;

SELECT * FROM visits
INNER JOIN animals ON visits.animals_id = animals.id
INNER JOIN vets ON visits.vets_id  = vets.id
ORDER BY visit_date DESC LIMIT 1;

SELECT COUNT(visits.animals_id) FROM visits
JOIN vets ON visits.vets_id = vets.id
JOIN animals ON visits.animals_id = animals.id
JOIN specializations ON specializations.vets_id = vets.id
WHERE specializations.species_id <> animals.species_id;

SELECT species.name, COUNT(visits.animals_id) FROM visits
JOIN vets ON visits.vets_id = vets.id
JOIN animals ON visits.animals_id = animals.id
JOIN species ON species.id = animals.species_id
WHERE vets.name = 'Maisy Smith'
GROUP BY species.name
ORDER BY count DESC LIMIT 1;
