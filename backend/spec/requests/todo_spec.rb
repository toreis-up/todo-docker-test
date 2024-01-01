require 'swagger_helper'

RSpec.describe "api/v1/todos", type: :request do
  path '/todos' do
    get 'Retrieves all todos' do
      consumes 'application/json'
      produces 'application/json'
      response 200, 'Fetch All Todo' do
        schema type: :object,
        properties: {
          items: {
            type: :array,
            items: {
              type: :object,
              properties: {
                id: { type: :number },
                title: { type: :string },
                detail: { type: :string, nullable: true },
                isDone: { type: :boolean },
                created_at: { type: :string, format: :datetime},
                updated_at: { type: :string, format: :datetime }
              },
            }
          }
        }

        FactoryBot.create_list(:todo, 10)
        run_test! do |response|
          json = JSON.parse(response.body, {:symbolize_names => true})

          expect(response.status).to eq(200)
          expect(json[:items].length).to eq(10)
        end
      end
    end
  end
  path '/todos/{id}' do
    get 'Retrieves todo' do
      produces 'application/json'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :number
      response 200, 'Fetch Todo' do
        schema type: :object,
        properties: {
          id: { type: :number },
          title: { type: :string },
          detail: { type: :string, nullable: true },
          isDone: { type: :boolean },
          created_at: { type: :string, format: :datetime},
          updated_at: { type: :string, format: :datetime }
        }
        todo = Todo.create(title: 'TestTodo', detail: 'TestDetail')
        let(:id) {todo.id}
        run_test! do |response|
          json = JSON.parse(response.body, {:symbolize_names => true})

          expect(response.status).to eq(200)
          expect(json[:item][:title]).to eq(todo.title)
          expect(json[:item][:detail]).to eq(todo.detail)
          expect(json[:item][:isDonw]).to eq(false)
        end
      end
      response 404, 'Not found' do
        let(:id) { 'invalid' }
        run_test! do |response|
          expect(response.status).to eq(404)
        end
      end
    end
    patch 'Update todo' do
      produces 'application/json'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :number
      response 200, 'Update Todo' do
        schema type: :object,
        properties: {
          id: { type: :number },
          title: { type: :string },
          detail: { type: :string, nullable: true },
          isDone: { type: :boolean },
          created_at: { type: :string, format: :datetime},
          updated_at: { type: :string, format: :datetime }
        }
        todo = Todo.create(title: 'TestTodo', detail: 'TestDetail')
        let(:id) {todo.id}
        run_test! do |response|
          json = JSON.parse(response.body, {:symbolize_names => true})

          expect(response.status).to eq(200)
          expect(json[:item][:title]).to eq(todo.title)
          expect(json[:item][:detail]).to eq(todo.detail)
          expect(json[:item][:isDonw]).to eq(false)
        end
      end
      response 404, 'Not found' do
      let(:id) { 'invalid' }
        run_test! do |response|
          expect(response.status).to eq(404)
        end
      end
    end
    delete 'Remove todo' do
      produces 'application/json'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :number
      response 200, 'Remove Todo' do
        todo = Todo.create(title: 'TestTodo', detail: 'TestDetail')
        let(:id) {todo.id}
        run_test! do |response|
          expect(response.status).to eq(200)
        end
      end
      response 404, 'Not found' do
        let(:id) { 'invalid' }
        run_test! do |response|
          expect(response.status).to eq(404)
        end
      end
    end
  end
end
