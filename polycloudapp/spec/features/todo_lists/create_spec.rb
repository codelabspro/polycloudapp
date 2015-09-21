require 'spec_helper'

describe "Creating todo lists" do

    it "redirects to the todo list index page on success" do
            visit "/todolists"
            click_link "New Todolist"
            expect(page).to have_content("New Todolist")

            fill_in "Title", with: "My todo list"
            fill_in "Description", with: "This is what I'm doing today"
            click_button "Create Todolist"

            expect(page).to have_content("Todolist was successfully created.")
    end

    it "displays an error when the todo has no title" do
        expect(Todolist.count).to eq(5)

        visit "/todolists"
        click_link "New Todolist"
        expect(page).to have_content("New Todolist")

        fill_in "Title", with: ""
        fill_in "Description", with: "This is what I'm doing today"
        click_button "Create Todolist"

        expect(page).to have_content("error")
        expect(Todolist.count).to eq(5)

        visit "/todolists"
        expect(page).to_not have_content("This is what I'm doing today")

    end

    it "displays an error when the todolist has a title less than 3 characters" do
        expect(Todolist.count).to eq(5)

        visit "/todolists"
        click_link "New Todolist"
        expect(page).to have_content("New Todolist")

        fill_in "Title", with: "Hi"
        fill_in "Description", with: "This is what I'm doing today"
        click_button "Create Todolist"

        expect(page).to have_content("error")
        expect(Todolist.count).to eq(5)

        visit "/todolists"
        expect(page).to_not have_content("This is what I'm doing today")

    end

end
