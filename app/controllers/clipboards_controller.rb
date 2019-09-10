class ClipboardsController < ApplicationController
    def show
        @clipboard = current_user.clipboard
    end

    def link
        @clipboard = current_user.clipboard
    end
end