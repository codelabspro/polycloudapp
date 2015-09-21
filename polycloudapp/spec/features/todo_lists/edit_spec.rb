require 'spec_helper'

describe "Creating todo lists" do

    it "updates a todo list successfully with correct information" do
        todolist = Todolist.create(title: "Back to school", description: "Back to school List")

        visit "/todolists"
        within "#todolist_#{todolist.id}" do
            click_link "Edit"
        end

        fill_in "Title", with: "New title"
        fill_in "Description", with: "New description"
        click_button "Update Todolist"

        todolist.reload

        expect(page).to have_content("Todolist was successfully updated.")
        expect(todolist.title).to eq("New title")
        expect(todolist.description).to eq("New description")
    end
end
