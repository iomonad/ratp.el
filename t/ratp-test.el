;;
;; Sample usage file.
;;

(require 'ratp)

;; Show destinations
(ratp:destination
  'metros ; OneOf [rers, metros, bus, tramways, noctiliens]
  '12) ; Transport code

;; Show lines
(ratp:lines
  'metros ; OneOf [rers, metros, bus, tramways, noctiliens]
  '12) ; Transport code
