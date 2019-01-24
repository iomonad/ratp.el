;;; ratp.el ---
;;
;; Filename: ratp.el
;; Description: RATP API Client for emacs
;; Author: Clement Trosa <me@trosa.io>
;; Maintainer: Clement Trosa <me@trosa.io>
;; Created: ven. janv.  4 15:20:29 2019 (+0100)
;    Updated: 2019/01/24 11:36:39 by iomonad          ###   ########.fr        ;
;;     Update #: 0
;; Version: 0.0.1
;; Package-Requires: (request.el)
;; URL: https://github.com/iomonad/ratp.el
;; Doc URL: https://github.com/iomonad/ratp.el
;; Keywords: ratp client
;; Compatibility: 25
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;   TODO: Write description
;;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Change Log:
;;   - 0.0.1: Project INIT
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or (at
;; your option) any later version.
;;
;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <https://www.gnu.org/licenses/>.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

(require 'request)

;;
;; Helpers & Constants
;;

(defconst ratp:base-url
  "https://api-ratp.pierre-grimaud.fr/v3"
  "API base URL for REST calls.")

;;
;; Destinations
;;

(defun ratp:destination (type ligne)
  "Retrieve destinations informations"
  (let* ((res (format "%s/destinations/%s/%s"
					  ratp:base-url type ligne))
		 (x (request
			 res
			 :parser 'json-read
			 :success (cl-function
					   (lambda (&key data &allow-other-keys)
						 (when data
						   (let* ((dest (nth 1 (car data)))
								  (arr (cdr dest))
								  (alle (cdr (car (aref arr 0))))
								  (retour (cdr (car (aref arr 1))))
								  (mes (format "%s <--> %s"
											   alle retour)))
							 (message mes))))))))
	(request-response-status-code x)))

(ratp:destination 'metros '12)

;;
;; Lines
;;

(defun ratp:lines (type ligne)
  "Retrieve lines informations."
  (let* ((res (format "%s/lines/%s/%s"
					  ratp:base-url type code)))
	;; WIP
	))

;;
;; Missions
;;

(defun ratp:mission (type ligne)
  "Retrieve RER's mission informations."
  (let* ((res (format "%s/mission/rers/%s/%s"
					  ratp:base-url type code)))
	;; WIP
	))

;;
;; Schedules
;;

(defun ratp:schedules (type code station way)
  "Retrieve schedules informations."
  (let* ((res (format "%s/schedules/%s/%s/%s/%s"
					  ratp:base-url type code station way)))
	;; WIP
	))

;;
;; Stations
;;

(defun ratp:station (type code station way)
  "Retrieve schedules informations."
  (let* ((res (format "%s/schedules/%s/%s/%s/%s"
					  ratp:base-url type code station way)))
	;; WIP
	))

;;
;; Traffic
;;

(defun ratp:traffic (type ligne)
  "Retrieve traffic status"
  (let*
	  ((ressource (format "%s/traffic/%s/%s"
						  ratp:base-url type ligne)))
	(print data)))

(ratp:traffic)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ratp.el ends here
