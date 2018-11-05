alias EspressoLog.Repo
alias EspressoLog.Accounts.Cafe_user

Repo.insert %Cafe_user{
  #id=1
  cafe_id: 1, # 'Test Cafe'
  user_id: 1, # 'Aspen James'
  admin: true,
  approved: true
}

Repo.insert %Cafe_user{
  #id=2
  cafe_id: 1, # 'Test Cafe'
  user_id: 2, # 'Manager Joleen'
  admin: false,
  approved: true
}

Repo.insert %Cafe_user{
  #id=3
  cafe_id: 1, # 'Test Cafe'
  user_id: 3, # 'Barista Joe'
  admin: false,
  approved: false
}

