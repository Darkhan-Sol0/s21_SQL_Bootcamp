CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(
                              pperson VARCHAR DEFAULT 'Dmitriy', 
                              pprice INTEGER DEFAULT 500,
                              pdata DATE DEFAULT '2022-01-08') 
  RETURNS TABLE (
    pizzeria_name VARCHAR
  ) AS $$
  BEGIN
    RETURN QUERY
      SELECT pizzeria.name 
      FROM pizzeria
        JOIN menu
          ON menu.pizzeria_id = pizzeria.id
        JOIN person_visits
          ON person_visits.pizzeria_id = pizzeria.id
        JOIN person
          ON person.id = person_visits.person_id
      WHERE
        person.name = pperson AND
        menu.price < pprice AND
        person_visits.visit_date = pdata;
        
  END;
$$ LANGUAGE PLPGSQL;

SELECT *
FROM fnc_person_visits_and_eats_on_date(pprice := 800);

SELECT *
FROM fnc_person_visits_and_eats_on_date(pperson := 'Anna', pprice := 1300, pdata := '2022-01-01');
