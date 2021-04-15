class TicketsController < ApplicationController

    def create 
        project = Project.find(params["ticket"]["project_id"])
        if project
            ticket = Ticket.new(title: params["ticket"]["title"], description: params["ticket"]["description"], created_by_id: params["ticket"]["created_by_id"])
            
            project.tickets << ticket
            ticket.save
        end
    end

    def update

        ticket = Ticket.find(params[:id])
        if ticket
            ticket.update(title: params["ticket"]["title"], description: params["ticket"]["description"], resolved: params["ticket"]["resolved"], task_id: params["ticket"]["task_id"])
        end
        render json: ticket
    end

    def show
        ticket = Ticket.find(params[:id])
        render json: ticket
    end

    def claim_ticket
        ticket = Ticket.find(params[:id])

        if ticket
            ticket.update(claimed_by_id: params["ticket"]["claimed_by_id"])
        end
        render json: ticket
    end

    def update_status
        ticket = Ticket.find(params[:id])
        if ticket && ticket.claimed_by.id == params["user"]["id"]
            ticket.update(resolved: params["ticket"]["resolved"])
        end
        render json: ticket
    end

end