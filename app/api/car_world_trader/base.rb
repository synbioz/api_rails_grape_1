module CarWorldTrader
  class Base < Grape::API
    mount CarWorldTrader::V1::Cars
  end
end
