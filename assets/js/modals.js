const initAddEntryModals = () => {
  const choosePersonInChargeElem = document.querySelector(
    '#choosePersonInCharge'
  )
  const chooseDepartmentElem = document.querySelector('#chooseDepartment')
  const editCategoryElem = document.querySelector('#categoryEditModal')
  const editPurposeElem = document.querySelector('#purposeEditModal')
  const editCategoryOfPerson = document.querySelector(
    '#categoryOfPersonEditModal'
  )
  const editDeleteDeadline = document.querySelector('#deleteDeadlineEditModal')

  M.Modal.init(choosePersonInChargeElem)
  M.Modal.init(chooseDepartmentElem)
  M.Modal.init(editCategoryElem)
  M.Modal.init(editPurposeElem)
  M.Modal.init(editCategoryOfPerson)
  M.Modal.init(editDeleteDeadline)
}

export default initAddEntryModals
