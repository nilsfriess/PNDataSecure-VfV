// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
// import 'phoenix_html'

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

// import socket from "./socket"

const TITLE_AUTOCOMPLETE_ENTRIES = {
  Finanzbuchhaltung: null,
  Jahresabrechnung: null,
  'Lohn- und \nGehaltsabrechnung': null,
  Mandantennewsletter: null,
  'Automatische Arbeitszeiterfassung': null
}

// Setup materialize stuff
const sidenavElem = document.querySelector('.sidenav')
M.Sidenav.init(sidenavElem)

const tapTargetElem = document.querySelector('.tap-target')
M.TapTarget.init(tapTargetElem)
// setup feature exploration
let tapTarget = M.TapTarget.getInstance(tapTargetElem)

// Open feature exploration for adding a new enry
const addCompanyTapEventButton = document.querySelector(
  '.add-comapany-tap-target'
)

// only available on specific pages, so check if undefined
if (addCompanyTapEventButton)
  addCompanyTapEventButton.addEventListener('click', () => {
    tapTarget.open()
  })

// #######################################
//setup all the autocomplete inputs

// title
const titleAutocompleteElem = document.querySelector('.title-autocomplete')
M.Autocomplete.init(titleAutocompleteElem, {
  data: TITLE_AUTOCOMPLETE_ENTRIES,
  limit: 5
})

// end of autocomplete setup
// #######################################

const choosePersonInChargeElem = document.querySelector('#choosePersonInCharge')
const chooseDepartmentElem = document.querySelector('#chooseDepartment')

M.Modal.init(choosePersonInChargeElem)
M.Modal.init(chooseDepartmentElem)
