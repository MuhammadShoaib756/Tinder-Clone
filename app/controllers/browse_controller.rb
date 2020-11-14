class BrowseController <ApplicationController
    def browse
        liked_account_ids = Like.where(account_id: current_account.id).map(&:liked_account_id)
        liked_account_ids << current_account.id
        @user =  Account.where.not(id: current_account.id)
        @matches =  current_account.matches

    end

    def approve
        # user swipe right
        rec_account_id = params[:id]
        logger.debug "User id for matching is #{current_account.id}"

        new_like = Like.new(liked_account_id:rec_account_id)
        new_like.account_id = current_account.id

        if new_like.save
            existing_like = Like.where(account_id: account_id, liked_account_id: current_account.id).count
            they_like_us = existing_like > 0
        else
            
        end
    end

    def decline
        # user swip left
    end

    def conversation
        id = params[:id]
        @profile = Account.find(id)
        like = Like.where(account_id: current_account.id, liked_account_id:id)
        @match = like.last if like.size > 0

        if @profile.present?
            respond_to do |format|
                format.js {
                    render "browse/conversation"                    
                 }
            end
        end
    end
    
    
end