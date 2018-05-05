const initAddEntryModals = () => {
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
}

export default initAddEntryModals
