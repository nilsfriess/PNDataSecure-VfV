# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Report.Repo.insert!(%Report.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Report.Administration.Company

company =
  Report.Administration.change_company(%Company{
    name: "PN DataSecure",
    address: "Königsberger Str. 5, 69198 Schriesheim",
    email: "info@pn-datasecure.de",
    phone: "017643853163"
  })

company = Report.Repo.insert!(company)

employee =
  Report.Administration.create_employee(
    %{
      "name" => "Friess",
      "prename" => "Nils",
      "email" => "nils.friess@pn-datasecure.de",
      "password" => "123.456."
    },
    company
  )
