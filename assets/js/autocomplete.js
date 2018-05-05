const initAddEntryAutocomplete = () => {
  const TITLE_AUTOCOMPLETE_ENTRIES = {
    Finanzbuchhaltung: null,
    Jahresabrechnung: null,
    'Lohn- und \nGehaltsabrechnung': null,
    Mandantennewsletter: null,
    'Automatische Arbeitszeiterfassung': null
  }

  const titleAutocompleteElem = document.querySelector('.title-autocomplete')
  M.Autocomplete.init(titleAutocompleteElem, {
    data: TITLE_AUTOCOMPLETE_ENTRIES,
    limit: 5
  })
}

export default initAddEntryAutocomplete
