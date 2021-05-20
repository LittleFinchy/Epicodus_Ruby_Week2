require("capybara/rspec")
require("./app")
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("create a stage path", { :type => :feature }) do
  it("creates a stage and then goes to the stage page") do
    visit("/stages")
    click_on("Add a new stage")
    fill_in("stage_name", :with => "Bingo")
    click_on("Go!")
    expect(page).to have_content("Bingo")
  end
end

describe("create an artist path", { :type => :feature }) do
  it("creates an stage and then goes to the stage page") do
    stage = Stage.new("Big", "Trap", nil)
    stage.save
    visit("/stages/#{stage.id}")
    fill_in("artist_name", :with => "Bread Man")
    click_on("Add Artist")
    expect(page).to have_content("Bread Man")
  end
end
