import initAddEntryModals from './modals'
import initComponents from './materializeLayout'
import initAddEntryAutocomplete from './autocomplete'
import {
  // editAndDeleteIcons,
  addCategoryCollectionItemToList,
  addPurposeCollectionItemToList,
  addCategoryOfPersonsCollectionItemToList,
  addDeleteDeadlineCollectionItemToList
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

    // Setup AddCatagoryOfPersonsButton

    const addCategoryOfPersonsButton = document.querySelector(
      '.add-person-category-btn'
    )
    const addCategoryOfPersonsInput = document.querySelector(
      '.add-person-category-input-field > input'
    )

    const categoryOfPersonsList = document.querySelector('.person-categories')

    addCategoryOfPersonsButton.addEventListener('click', () => {
      addCategoryOfPersonsCollectionItemToList(
        categoryOfPersonsList,
        addCategoryOfPersonsInput
      )
    })

    addCategoryOfPersonsInput.addEventListener('keyup', event => {
      if (event.keyCode === 13) {
        addCategoryOfPersonsCollectionItemToList(
          categoryOfPersonsList,
          addCategoryOfPersonsInput
        )
      }
    })

    // End of setup AddCatagoryOfPersonsButton

    // Setup CategoryButton

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

    // End of setup CategoryButton

    // Setup purposeButton

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

    // End of setup PurposeButton

    // Setup of DeleteDeadlineButton

    const addDeleteDeadlineButton = document.querySelector(
      '.add-delete-deadlines-btn'
    )
    const addDeleteDeadlineInput = document.querySelector(
      '.add-delete-deadlines-input-field > input'
    )

    const deleteDeadlineList = document.querySelector('.delete-deadlines')

    addDeleteDeadlineButton.addEventListener('click', () => {
      console.log('del')
      addDeleteDeadlineCollectionItemToList(
        deleteDeadlineList,
        addDeleteDeadlineInput
      )
    })

    addDeleteDeadlineInput.addEventListener('keyup', event => {
      if (event.keyCode === 13) {
        addDeleteDeadlineCollectionItemToList(
          deleteDeadlineList,
          addDeleteDeadlineInput
        )
      }
    })

    // End of Setup of DeleteDeadlineButton

    // document
    //   .querySelector('.new-entry-form')
    //   .addEventListener('keyup', event => {
    //     if (event.keyCode === 13) {
    //       console.log(event.target)

    //       event.preventDefault()
    //     }
    //   })
  }
})
