require 'spec_helper'

describe "Creating todo lists" do

    let!(:todolist) {Todolist.create(title: "Back to school", description: "Back to school List")}

    def update_todolist(options={})

        options[:title] ||= "My Todo List"
        options[:description] ||= "This is my todo list"
        visit "/todolists"
        todolist = options[:todolist]

        within "#todolist_#{todolist.id}" do
            click_link "Edit"
        end

        fill_in "Title", with: options[:title]
        fill_in "Description", with: options[:description]
        click_button "Update Todolist"

    end


    it "updates a todo list successfully with correct information" do


        update_todolist todolist: todolist,
                        title: "New title",
                        description: "New description"

        todolist.reload

        expect(page).to have_content("Todolist was successfully updated.")
        expect(todolist.title).to eq("New title")
        expect(todolist.description).to eq("New description")
    end
end
