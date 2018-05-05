import initAddEntryModals from './modals'
import initComponents from './materializeLayout'
import initAddEntryAutocomplete from './autocomplete'
import {
  editAndDeleteIcons,
  addCategoryCollectionItemToList,
  addPurposeCollectionItemToList
} from './listHelpers'

// END OF GLOABL VARS
// ##################################################################

document.addEventListener('DOMContentLoaded', event => {
  console.log('LOADED')

  initComponents()

  // Init all the components needed in the "add entry page"
  if (location.pathname === '/records/new') {
    initAddEntryModals()
    initAddEntryAutocomplete()

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
  }
})
