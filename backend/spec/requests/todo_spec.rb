require 'rails_helper'

describe "Status" do
  it "GET /todos" do
    FactoryBot.create_list(:todo, 10)
    get "/todos"
    json = JSON.parse(response.body, {:symbolize_names => true})

    expect(response.status).to eq(200)
    expect(json[:items].length).to eq(10)
  end
  it "GET /todos/:id" do
    todo = create(:todo, title: "テストTODOの1")
    get "/todos/#{todo.id}"
    json = JSON.parse(response.body, {:symbolize_names => true})
    expect(response.status).to eq(200)
    expect(json[:item][:title]).to eq(todo["title"])
  end
  it "GET /todos/:not_recorded_id" do
    get "/todos/-1"

    expect(response.status).to eq(404)
  end
  it "PUT /todos/:id" do
    todo = create(:todo, title: "PUT TEST")
    get "/todos/#{todo.id}"
    put "/todos/#{todo.id}", params: { "isDone": true }, as: :json

    expect(response.status).to eq(200)
    expect(todo.reload.isDone).to eq(true)
  end
  it "DELETE /todos/:id" do
    todo = create(:todo)

    expect { delete "/todos/#{todo.id}" }.to change(Todo, :count).by(-1)

    expect(response.status).to eq(204)
  end
end
