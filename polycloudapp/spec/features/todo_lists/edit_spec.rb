require 'spec_helper'

describe "Creating todo lists" do

<<<<<<< HEAD
    let!(:todolist) {Todolist.create(title: "Back to school", description: "Back to school List")}

    def update_todolist(options={})

        options[:title] ||= "My Todo List"
        options[:description] ||= "This is my todo list"
        visit "/todolists"
        todolist = options[:todolist]

=======
    it "updates a todo list successfully with correct information" do
        todolist = Todolist.create(title: "Back to school", description: "Back to school List")

        visit "/todolists"
>>>>>>> 9bd3933a0e7529a27a7ba2d5e3d0f6b2fffa2fb1
        within "#todolist_#{todolist.id}" do
            click_link "Edit"
        end

<<<<<<< HEAD
        fill_in "Title", with: options[:title]
        fill_in "Description", with: options[:description]
        click_button "Update Todolist"

    end


    it "updates a todo list successfully with correct information" do


        update_todolist todolist: todolist,
                        title: "New title",
                        description: "New description"

=======
        fill_in "Title", with: "New title"
        fill_in "Description", with: "New description"
        click_button "Update Todolist"

>>>>>>> 9bd3933a0e7529a27a7ba2d5e3d0f6b2fffa2fb1
        todolist.reload

        expect(page).to have_content("Todolist was successfully updated.")
        expect(todolist.title).to eq("New title")
        expect(todolist.description).to eq("New description")
    end
end
