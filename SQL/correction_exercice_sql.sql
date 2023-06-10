/*01*/
SELECT nom_et, prenom_et
FROM etudiant
ORDER BY nom_et, prenom_et;

/*02*/
SELECT count(*)
FROM classe;

/*03*/
SELECT nom_et, prenom_et
FROM etudiant e, classe c
WHERE e.id_classe = c.num_classe
AND nom_classe IN ('BTS SIO A','BTS SIO B');

/*04*/
SELECT nom_classe, count(num_et)
FROM classe c, etudiant e
WHERE e.id_classe = c.num_classe
GROUP BY num_classe
HAVING count(num_et)>24;

/*05*/
SELECT nom_et, prenom_et, date_naiss_et
FROM etudiant
WHERE date_naiss_et BETWEEN '1987-12-24' AND '1990-12-24';

/*06*/
SELECT nom_mat,note
FROM etudiant e, obtenir o, matieres m
WHERE nom_et = "TRADER"
AND prenom_et= "Basile"
AND e.num_et = o.num_et
AND o.num_mat = m.num_mat;

/*07*/
SELECT nom_mat, ROUND(AVG(note),2) as moyenne
FROM matieres m, obtenir o, classe c, etudiant e
WHERE nom_classe = "BTS IG"
AND e.id_classe = c.num_classe
AND o.num_et = e.num_et
AND o.num_mat = m.num_mat
GROUP BY m.num_mat
HAVING moyenne < 10;

/*08*/
SELECT nom_classe, ROUND(AVG(note),2) AS moy
FROM obtenir o, etudiant e, classe c
WHERE nom_classe = "BTS SIO A"
AND e.id_classe = c.num_classe
AND e.num_et = o.num_et;

/*09*/
SELECT nom_et, prenom_et, ROUND(AVG(note),2) AS moy
FROM obtenir o, etudiant e, classe c
WHERE nom_classe = "BTS SIO B"
AND e.id_classe = c.num_classe
AND e.num_et = o.num_et
GROUP BY e.num_et;

/*10*/
SELECT nom_et, prenom_et, ROUND(AVG(note),2) as moy
FROM obtenir o, etudiant e, classe c
WHERE nom_classe = "BTS IG"
AND e.id_classe = c.num_classe
AND o.num_et = e.num_et
GROUP BY e.num_et
HAVING moy < (SELECT ROUND(AVG(note),2)
 FROM obtenir o, etudiant e, classe c
WHERE nom_classe = "BTS IG"
AND e.id_classe = c.num_classe
AND o.num_et = e.num_et
);

/*11*/
SELECT nom_et, prenom_et, id_classe
FROM etudiant
WHERE id_classe IS NULL;

/*12*/
(
SELECT c.nom_classe, COUNT(e.num_et) as nbe 
FROM etudiant e, classe c
WHERE c.num_classe = e.id_classe
GROUP BY nom_classe
)
UNION
(
SELECT nom_classe, 0 AS nbe
FROM classe
WHERE num_classe NOT IN (SELECT DISTINCT id_classe
                         FROM etudiant
                        WHERE id_classe IS NOT NULL)
)
/*13*/
DELETE FROM obtenir
WHERE obtenir.num_et IN
    (SELECT e.num_et
     FROM etudiant e
     WHERE e.num_classe IN
         (SELECT c.num_classe
         FROM classe c
         WHERE c.nom_classe IN ("BTS IG A","BTS IG B")));
DELETE FROM etudiant
     WHERE etudiant.num_classe IN
         (SELECT c.num_classe
         FROM classe c
         WHERE c.nom_classe IN ("BTS IG A","BTS IG B"));
DELETE FROM comprendre
     WHERE comprendre.num_classe IN
         (SELECT c.num_classe
         FROM classe c
         WHERE c.nom_classe IN ("BTS IG A","BTS IG B"));
DELETE FROM classe
         WHERE classe.nom_classe IN ("BTS IG A","BTS IG B"));

/*14*/
SELECT num_classe, nom_classe, count(num_et) AS nbe
FROM etudiant e, classe c
WHERE e.id_classe = c.num_classe
GROUP BY num_classe;

/*15*/
SELECT MAX(t.moy)
FROM 
(
	SELECT e.num_et, ROUND(AVG(o.note),2) as moy
	FROM obtenir o, etudiant e, classe c
    WHERE (nom_classe = "BTS IG A" 
           OR nom_classe = "BTS IG B")
	AND o.num_et = e.num_et
	AND e.id_classe = c.num_classe
	GROUP BY num_et
) t

/*16*/
(
SELECT c.nom_classe, COUNT(e.num_et) as nbe 
FROM etudiant e, classe c
WHERE e.id_classe = c.num_classe
GROUP BY c.num_classe
HAVING nbe < 15
)
UNION
(
SELECT nom_classe, 0 AS nbe
FROM classe
WHERE num_classe NOT IN (SELECT DISTINCT id_classe
                         FROM etudiant
                        WHERE id_classe IS NOT NULL)
)

/*17*/
SELECT nom_mat, note
FROM etudiant e, obtenir o, matieres m
WHERE nom_et = "Sehef"
AND prenom_et= "Hassan"
AND nom_mat = 'Mathématiques'
AND e.num_et = o.num_et
AND o.num_mat = m.num_mat;

/*18*/
SELECT nom_et, prenom_et, nom_mat, apreciation
FROM etudiant e, obtenir o, matieres m
WHERE nom_et = "Murray"
AND prenom_et= "Bill"
AND nom_mat = 'Anglais'
AND e.num_et = o.num_et
AND o.num_mat = m.num_mat;

/*19*/
SELECT v.nom_mat, MAX(v.notes) AS max_notes
FROM (
   SELECT m.num_mat, m.nom_mat, COUNT(o.note) AS notes
   FROM obtenir o, matieres m
   WHERE o.num_mat = m.num_mat
   GROUP BY m.num_mat
) AS v; 

/*20*/
(SELECT e.nom_et, e.prenom_et, e.num_classe, MAX(t2.moyenne)
FROM
    (SELECT e.num_et, c.num_classe, ROUND(AVG(o.note),2) AS moyenne
    FROM etudiant e, obtenir o, classe c
    WHERE e.num_et = o.num_et
    AND e.num_classe = c.num_classe
    GROUP BY e.num_et, c.num_classe
    ) t2, etudiant e
    WHERE e.num_et = t2.num_et
    GROUP BY t2.num_classe
);