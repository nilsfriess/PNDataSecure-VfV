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

// ##################################################################
// GLOBAL VARS

const TITLE_AUTOCOMPLETE_ENTRIES = {
  Finanzbuchhaltung: null,
  Jahresabrechnung: null,
  'Lohn- und \nGehaltsabrechnung': null,
  Mandantennewsletter: null,
  'Automatische Arbeitszeiterfassung': null
}

let currentListItem = undefined

// END OF GLOABL VARS
// ##################################################################

document.addEventListener('DOMContentLoaded', event => {
  console.log('LOADED')

  // Setup materialize stuff
  const sidenavElem = document.querySelector('.sidenav')
  M.Sidenav.init(sidenavElem)

  const tapTargetElem = document.querySelector('.tap-target')
  const tapTarget = M.TapTarget.init(tapTargetElem)

  // Open feature exploration for adding a new enry
  const addCompanyTapEventButton = document.querySelector(
    '.add-comapany-tap-target'
  )

  if (addCompanyTapEventButton)
    addCompanyTapEventButton.addEventListener('click', () => {
      tapTarget.open()
    })

  // setup FAB
  const fabElem = document.querySelector('.fixed-action-btn')
  var instance = M.FloatingActionButton.init(fabElem, { direction: 'left' })

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

  const choosePersonInChargeElem = document.querySelector(
    '#choosePersonInCharge'
  )
  const chooseDepartmentElem = document.querySelector('#chooseDepartment')
  const editCategoryElem = document.querySelector('#categoryEditModal')
  const editPurposeElem = document.querySelector('#purposeEditModal')

  M.Modal.init(choosePersonInChargeElem)
  M.Modal.init(chooseDepartmentElem)
  M.Modal.init(editCategoryElem)
  M.Modal.init(editPurposeElem)

  // setup add category button

  const addCategoryButton = document.querySelector('.add-category-btn')
  const addCategoryInput = document.querySelector(
    '.add-category-input-field > input'
  )

  const categoryList = document.querySelector('.categories')

  addCategoryButton.addEventListener('click', () => {
    addCategoryCollectionItemToList(categoryList, addCategoryInput)
  })

  addCategoryInput.addEventListener('keyup', event => {
    if (event.keyCode === 13) {
      addCategoryCollectionItemToList(categoryList, addCategoryInput)
    }
  })

  // end of setup add category button

  // setup add purpose button

  const addPurposeButton = document.querySelector('.add-purpose-btn')
  const addPurposeInput = document.querySelector(
    '.add-purpose-input-field > input'
  )

  const purposeList = document.querySelector('.purposes')

  addPurposeButton.addEventListener('click', () => {
    addPurposeCollectionItemToList(purposeList, addPurposeInput)
  })

  addPurposeInput.addEventListener('keyup', event => {
    if (event.keyCode === 13) {
      addPurposeCollectionItemToList(purposeList, addPurposeInput)
    }
  })

  // end of setup add purpose button
})

const editAndDeleteIcons = () => {
  const links = document.createElement('div')
  links.className = 'secondary-content scale-transition scale-out'

  const addLink = document.createElement('a')
  const addIcon = document.createElement('i')
  addIcon.className = 'material-icons teal-text'
  addIcon.innerHTML = 'edit'

  addLink.href = '#'

  const deleteLink = document.createElement('a')
  const deleteIcon = document.createElement('i')
  deleteIcon.className = 'material-icons red-text delete-icon'
  deleteIcon.innerHTML = 'delete'
  deleteLink.href = '#'

  addLink.appendChild(addIcon)
  deleteLink.appendChild(deleteIcon)

  links.appendChild(addLink)
  links.appendChild(deleteLink)

  return links
}

const addCategoryCollectionItemToList = (list, input) => {
  if (!input.value.replace(/\s/g, '').length) return

  const newListItem = document.createElement('li')
  newListItem.className = 'collection-item'

  const categoryItem = document.createTextNode(input.value)
  newListItem.appendChild(categoryItem)

  const iconLinks = newListItem.appendChild(editAndDeleteIcons())

  // show edit and delete icons on hover
  newListItem.addEventListener('mouseover', () => {
    iconLinks.classList.add('scale-in')
  })

  newListItem.addEventListener('mouseleave', () => {
    iconLinks.classList.remove('scale-in')
  })

  // add event handler for deletion
  iconLinks.childNodes[1].addEventListener('click', () => {
    newListItem.remove()
  })

  // add event handler for edit

  // get the modal
  const editCategoryElem = document.querySelector('#categoryEditModal')
  const modalInstance = M.Modal.getInstance(editCategoryElem)

  iconLinks.childNodes[0].addEventListener('click', () => {
    modalInstance.open()

    const currentListItemValue = newListItem.childNodes[0].textContent

    document.querySelector('#categoryEdit').value = currentListItemValue
    M.updateTextFields()

    // save new value on modal close
    modalInstance.options.onCloseStart = () => {
      newListItem.childNodes[0].textContent = document.querySelector(
        '#categoryEdit'
      ).value
    }
  })

  list.appendChild(newListItem)

  input.value = ''
  input.focus()
}

const addPurposeCollectionItemToList = (list, input) => {
  if (!input.value.replace(/\s/g, '').length) return

  const newListItem = document.createElement('li')
  newListItem.className = 'collection-item'

  const categoryItem = document.createTextNode(input.value)
  newListItem.appendChild(categoryItem)

  const iconLinks = newListItem.appendChild(editAndDeleteIcons())

  // show edit and delete icons on hover
  newListItem.addEventListener('mouseover', () => {
    iconLinks.classList.add('scale-in')
  })

  newListItem.addEventListener('mouseleave', () => {
    iconLinks.classList.remove('scale-in')
  })

  // add event handler for deletion
  iconLinks.childNodes[1].addEventListener('click', () => {
    newListItem.remove()
  })

  // add event handler for edit

  // get the modal
  const editPurposeElem = document.querySelector('#purposeEditModal')
  const modalInstance = M.Modal.getInstance(editPurposeElem)

  iconLinks.childNodes[0].addEventListener('click', () => {
    modalInstance.open()

    const currentListItemValue = newListItem.childNodes[0].textContent

    document.querySelector('#purposeEdit').value = currentListItemValue
    M.updateTextFields()

    // save new value on modal close
    modalInstance.options.onCloseStart = () => {
      newListItem.childNodes[0].textContent = document.querySelector(
        '#purposeEdit'
      ).value
    }
  })

  list.appendChild(newListItem)

  input.value = ''
  input.focus()
}
