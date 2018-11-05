alias EspressoLog.Repo
alias EspressoLog.Accounts.User

import Comeonin.Bcrypt, only: [hashpwsalt: 1]

Repo.insert %User{
  # id=1
  name: "Aspen James",
  email: "aspen@email.com",
  password_hash: hashpwsalt("P@ssw0rd!")
}

Repo.insert %User{
  #id=2
  name: "Manager Joleen",
  email: "joleen@email.com",
  password_hash: hashpwsalt("P@ssw0rd!")
}

Repo.insert %User{
  #id=3
  name: "Barista Joe",
  email: "joe@email.com",
  password_hash: hashpwsalt("P@ssw0rd!")
}