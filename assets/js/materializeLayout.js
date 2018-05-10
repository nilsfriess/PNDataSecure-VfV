const initComponents = () => {
  // Setup materialize stuff
  const sidenavElem = document.querySelector('.sidenav')
  M.Sidenav.init(sidenavElem)

  if (location.pathname !== '/records/new') {
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
  }
}

export default initComponents
