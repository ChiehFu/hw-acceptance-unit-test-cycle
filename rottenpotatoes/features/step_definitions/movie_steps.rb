Given(/^the following movies exist:$/) do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  table.hashes.each do |movie|
      Movie.create!(movie)
  end
end

Then(/^the director of "(.*)" should be "(.*)"$/) do |arg1, arg2|
  movie = Movie.find_by_title(arg1)
  expect(movie.director).to eq arg2
end

Given(/^the following movies exist$/) do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  table.hashes.each do |movie|
      Movie.create!(movie)
  end
end

Then(/^I should see "(.*)" before "(.*)"$/) do |e1, e2|
  first_position = page.body.index(e1)
  second_position = page.body.index(e2)
  first_position.should < second_position
end
