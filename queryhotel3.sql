8) Fai un'analisi per vedere se ci sono ore in cui le prenotazioni sono più frequenti

SELECT COUNT(id), HOUR(`created_at`) 
FROM `prenotazioni`
GROUP BY HOUR(`created_at`)

9) Le stanze sono state tutte prenotate almeno una volta? (Visualizzare le stanze non ancora prenotate)

SELECT COUNT(`stanza_id`), `stanza_id` 
FROM `prenotazioni` 
GROUP BY (`stanza_id`)
HAVING COUNT(`stanza_id`) = 0


10) Come si chiamano gli ospiti che hanno fatto più di due prenotazioni?

SELECT COUNT(`prenotazione_id`), prenotazioni_has_ospiti.ospite_id, ospiti.name, ospiti.lastname
FROM `prenotazioni_has_ospiti`
INNER JOIN `ospiti`
ON ospiti.id = prenotazioni_has_ospiti.ospite_id
GROUP BY `ospite_id`
HAVING COUNT(`prenotazione_id`) > 2
