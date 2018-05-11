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

  // add the item to the hidden input #entry_purposes
  const entry_purposes_input = document.querySelector('#entry_purposes')
  const textContent =
    entry_purposes_input.textContent == ''
      ? '[]'
      : entry_purposes_input.textContent

  const current_purposes = JSON.parse(textContent)
  // append new item
  current_purposes.push(input.value)
  entry_purposes_input.textContent = JSON.stringify(current_purposes)

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

  // // add the item to the hidden input #entry_purposes
  // const entry_purposes_input = document.querySelector('#entry_purposes')
  // const textContent =
  //   entry_purposes_input.textContent == ''
  //     ? '[]'
  //     : entry_purposes_input.textContent

  // const current_purposes = JSON.parse(textContent)
  // // append new item
  // current_purposes.push(input.value)
  // entry_purposes_input.textContent = JSON.stringify(current_purposes)

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
