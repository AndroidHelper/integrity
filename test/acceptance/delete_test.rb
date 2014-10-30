require "helper/acceptance"

class DeleteTest < Test::Unit::AcceptanceTestCase
  story <<-EOS
    As an administrator,
    I want to delete projects I don't care about anymore
    And busted builds
  EOS

  scenario "Deleting a project from the edit page" do
    Project.gen(:integrity)

    login_as "admin", "test"
    visit "/integrity"
    click_link "Edit"
    click_button "Yes, I'm sure, nuke it"
    visit "/"

    assert_have_no_tag("ul#projects", :content => "Integrity")
  end
end
