class Application

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if item = req.path.match(/items/)
            name = req.path.split("/items/").last
            my_item = @@items.find{|i| i.name == name}
            if my_item
                resp.write my_item.price
            else
                resp.write "Item not found"
                resp.status = 400
            end
        else
            resp.write "Route not found"
            resp.status = 404
        end
        resp.finish
    end
end
