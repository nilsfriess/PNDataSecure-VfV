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

const addCategoryOfPersonsCollectionItemToList = (list, input) => {
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
  iconLinks.childNodes[1].addEventListener('click', event => {
    newListItem.remove()
    event.preventDefault()
  })

  // add the item to the hidden input #categories_of_persons
  const entry_categories_of_persons_input = document.querySelector(
    '#categories_of_persons'
  )
  const textContent =
    entry_categories_of_persons_input.value == ''
      ? '[]'
      : entry_categories_of_persons_input.value

  const current_categories_of_persons = JSON.parse(textContent)
  // append new item
  current_categories_of_persons.push(input.value)
  entry_categories_of_persons_input.value = JSON.stringify(
    current_categories_of_persons
  )

  // add event handler for edit

  // get the modal
  const editCategoryElem = document.querySelector('#categoryOfPersonEditModal')
  console.log(editCategoryElem)

  const modalInstance = M.Modal.getInstance(editCategoryElem)

  iconLinks.childNodes[0].addEventListener('click', () => {
    modalInstance.open()

    const currentListItemValue = newListItem.childNodes[0].textContent

    document.querySelector('#categoryOfPersonEdit').value = currentListItemValue
    M.updateTextFields()

    // save new value on modal close
    modalInstance.options.onCloseStart = () => {
      newListItem.childNodes[0].textContent = document.querySelector(
        '#categoryOfPersonEdit'
      ).value
    }
  })

  list.appendChild(newListItem)

  input.value = ''
  input.focus()
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
  iconLinks.childNodes[1].addEventListener('click', event => {
    newListItem.remove()
    event.preventDefault()
  })

  // add the item to the hidden input #categories
  const entry_categories_input = document.querySelector('#categories')
  const textContent =
    entry_categories_input.value == '' ? '[]' : entry_categories_input.value

  const current_categories = JSON.parse(textContent)
  // append new item
  current_categories.push(input.value)
  entry_categories_input.value = JSON.stringify(current_categories)

  // add event handler for edit

  // get the modal
  const editCategoryElem = document.querySelector('#categoryEditModal')
  console.log(editCategoryElem)
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

  // add the item to the hidden input #purposes
  const entry_purposes_input = document.querySelector('#purposes')
  const textContent =
    entry_purposes_input.value == '' ? '[]' : entry_purposes_input.value

  const current_purposes = JSON.parse(textContent)
  // append new item
  current_purposes.push(input.value)
  entry_purposes_input.value = JSON.stringify(current_purposes)

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

const addDeleteDeadlineCollectionItemToList = (list, input) => {
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

  // add the item to the hidden input #delete_deadlines
  const entry_delete_deadlines_input = document.querySelector(
    '#delete_deadlines'
  )
  const textContent =
    entry_delete_deadlines_input.value == ''
      ? '[]'
      : entry_delete_deadlines_input.value

  const current_delete_deadlines = JSON.parse(textContent)
  // append new item
  current_delete_deadlines.push(input.value)
  entry_delete_deadlines_input.value = JSON.stringify(current_delete_deadlines)

  // add event handler for edit
  // get the modal
  const editPurposeElem = document.querySelector('#deleteDeadlineEditModal')
  const modalInstance = M.Modal.getInstance(editPurposeElem)

  iconLinks.childNodes[0].addEventListener('click', () => {
    modalInstance.open()

    const currentListItemValue = newListItem.childNodes[0].textContent

    document.querySelector('#deleteDeadlineEdit').value = currentListItemValue
    M.updateTextFields()

    // save new value on modal close
    modalInstance.options.onCloseStart = () => {
      newListItem.childNodes[0].textContent = document.querySelector(
        '#deleteDeadlineEdit'
      ).value
    }
  })

  list.appendChild(newListItem)

  input.value = ''
  input.focus()
}

export {
  editAndDeleteIcons,
  addCategoryOfPersonsCollectionItemToList,
  addCategoryCollectionItemToList,
  addPurposeCollectionItemToList,
  addDeleteDeadlineCollectionItemToList
}
