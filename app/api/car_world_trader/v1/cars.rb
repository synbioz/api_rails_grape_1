module CarWorldTrader
  module V1
    class Cars < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api

      resource :cars do
        desc "Return list of cars"
        get do
          Car.all
        end

        desc "Return a car"
        params do
          requires :id, type: Integer, desc: "Car id"
        end
        route_param :id do
          get do
            Car.find(params[:id])
          end
        end

        desc "Create a car"
        params do
          requires :car, type: Hash do
            requires :manufacturer, type: String
            requires :design, type: String
            requires :style, type: String
          end
        end
        post do
          Car.create!(params[:car])
        end

        desc "Update a car"
        params do
          requires :id, type: Integer, desc: "Status id"
          requires :car, type: Hash, desc: "Your updated car"
        end
        put ':id' do
          Car.find(params[:id]).update_attributes(params[:car])
        end

        desc "Delete a car"
        params do
          requires :id, type: Integer, desc: "Status id"
        end
        delete ':id' do
          Car.find(params[:id]).destroy
        end
      end
    end
  end
end
