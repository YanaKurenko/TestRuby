require "test_helper"

class AuthorsControllerTest < ActionDispatch::IntegrationTest

  test "get index" do
    get authors_url
    assert_response :success
  end

  test "show author" do 
    get author_url(Author.first), headers: { "HTTP_REFERER" => "http://127.0.0.1:3000/authors/" }
    assert_response :success
  end

  test "create author" do
    assert_difference("Author.count") do
      post authors_url, params: { author: { fname: "Yana", lname: "Kurenko", email: "jana.kurenko@mail.com" } }
    end
  
    assert_redirected_to author_path(Author.last)
    
  end

  test "update author" do 
    author = Author.last
    patch author_url(author), params: { author: { fname: "Updated Name", lname: "Updated Last Name", email: "jana.kurenkoupdated@mail.com" } }, xhr: true

    assert_redirected_to author_path(author)
  end


  # test "should get index" do
  #   get :index
  #   assert_response :success
  #   assert_not_nil assigns(:authors)
  # end

  # test "create author" do
  #   author = authors(:one) 
  #   assert author.valid?, "Author is not valid" 
  #   assert author.save, "Could not save the author" 
  # end

  # test "update author" do
  #   author = authors(:one) 
  #   new_fname = "NewFirstName"
  #   new_lname = "NewLastName"
  #   new_email = "newemail@example.com"

  #   author_params = {
  #     fname: new_fname,
  #     lname: new_lname,
  #     email: new_email
  #   }

  #   assert_difference('Author.count', 0) do
  #     assert authors(:one).update(author_params), "Author not updated"
  #   end
    
  #   updated_author = Author.find(authors(:one).id)
  #   assert_equal new_fname, updated_author.fname
  #   assert_equal new_lname, updated_author.lname
  #   assert_equal new_email, updated_author.email
  # end

  # test "destroy author" do
  #   author = authors(:two) 
  #   assert_difference('Author.count', -1) do 
  #     author.destroy 
  #   end
  # end

end
