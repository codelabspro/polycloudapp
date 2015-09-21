require 'spec_helper'

describe "Creating todo lists" do

    def create_todolist(options={})
        options[:title] ||= "My Todo List"
        options[:description] ||= "This is my todo list"

        visit "/todolists"
        click_link "New Todolist"
        expect(page).to have_content("New Todolist")

        fill_in "Title", with: options[:title]
        fill_in "Description", with: options[:description]
        click_button "Create Todolist"

    end


    it "redirects to the todo list index page on success" do
            create_todolist
            expect(page).to have_content("Todolist was successfully created.")
    end

    it "displays an error when the todo has no title" do
        expect(Todolist.count).to eq(5)

        create_todolist title: ""

        expect(page).to have_content("error")
        expect(Todolist.count).to eq(5)

        visit "/todolists"
        expect(page).to_not have_content("This is what I'm doing today")

    end

    it "displays an error when the todolist has a title less than 3 characters" do
        expect(Todolist.count).to eq(5)

        create_todolist title: "Hi"

        expect(page).to have_content("error")
        expect(Todolist.count).to eq(5)

        visit "/todolists"
        expect(page).to_not have_content("This is what I'm doing today")

    end

    it "displays an error when the todolist has no description" do
        expect(Todolist.count).to eq(5)

        create_todolist title: "Grocery List", description: ""

        expect(page).to have_content("error")
        expect(Todolist.count).to eq(5)

        visit "/todolists"
        expect(page).to_not have_content("Grocery List")

    end

    it "displays an error when the todolist has a description less than 5 characters" do
        expect(Todolist.count).to eq(5)

        create_todolist title: "Grocery List", description: "Food"

        expect(page).to have_content("error")
        expect(Todolist.count).to eq(5)

        visit "/todolists"
        expect(page).to_not have_content("Grocery List")

    end

end
