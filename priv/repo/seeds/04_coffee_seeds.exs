alias EspressoLog.Repo
alias EspressoLog.Coffees.Coffee

Repo.insert %Coffee{
  #id=1
  name: "Guatemala La Bolsa",
  cafe_id: 1 # 'Test Cafe'
}

Repo.insert %Coffee{
  #id=2
  name: "Ethiopia Chelelektu",
  cafe_id: 1 # 'Test Cafe'
}