alias EspressoLog.Repo
alias EspressoLog.Coffees.Espresso

Repo.insert %Espresso{
  dose: 18,
  yield: 36,
  time: 25,
  days_off_roast: 4,
  notes: "Classic Guat, tasty",
  coffee_id: 1, # Guatemala
  user_id: 1 # 'Aspen James'
}

Repo.insert %Espresso{
  dose: 18,
  yield: 32,
  time: 28,
  days_off_roast: 5,
  notes: "Very chocolaty and dense",
  coffee_id: 1, # Guatemala
  user_id: 2 # 'Manager Joleen'
}

Repo.insert %Espresso{
  dose: 19,
  yield: 42,
  time: 26,
  days_off_roast: 4,
  notes: "Light, fragrant",
  coffee_id: 2, # Ethiopia
  user_id: 1 # 'Aspen James'
}

Repo.insert %Espresso{
  dose: 18,
  yield: 38,
  time: 27,
  days_off_roast: 5,
  notes: "Pretty tasty, lemon zest",
  coffee_id: 2, # Ethiopia
  user_id: 2 # 'Manager Joleen'
}

Repo.insert %Espresso{
  dose: 18,
  yield: 30,
  time: 32,
  days_off_roast: 6,
  notes: "Coffee was off today, pulled short",
  coffee_id: 1, # Guatemala
  user_id: 1 # 'Aspen James'
}

Repo.insert %Espresso{
  dose: 19,
  yield: 36,
  time: 26,
  days_off_roast: 6,
  notes: "Concentrated, intense, but delicious",
  coffee_id: 2, # Ethiopia
  user_id: 1 # 'Aspen James'
}

