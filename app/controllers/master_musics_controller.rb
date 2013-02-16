# -*- coding: utf-8 -*-
class MasterMusicsController < ApplicationController
  def master
    @master_game = MasterGame.all
    @master_music = MasterMusic.all
    @title = "BEATECH部内大会 Master部門"

    @music_by_game = Array.new
    (@master_game.size).times do |i|
      @music_by_game[i] = MasterMusic.find(:all, :conditions => {:game => i})
      (@music_by_game[i].size).times do |j|
        @music_by_game[i][j].number = @music_by_game[i][j].voter.split(",").size
      end
      @music_by_game[i].sort!{|a,b| b.number <=> a.number}
    end

    
  end
  
  def index
  end

  def show
  end

  def new
    @master_games = MasterGame.all
    @game = params[:id]
    @master_music = MasterMusic.new
    @master_music.game = @game
    @title = @master_games[@game.to_i].title + " の譜面の追加"
  end

  def edit
  end

  def create
    @master_music = MasterMusic.new
    @master_music.title = params[:music][:title]
    @master_music.game = params[:master_music][:game].to_i
    @master_music.voter = @current_user.account if @current_user
    @master_music.save

    redirect_to root_url + 'master', :notice => '対戦機種を追加しました。'     
  end

  def update
  end

  def destoy
  end

  def vote
    @master_music = MasterMusic.find(params[:music][:id])
    @master_music.voter = @master_music.voter + ',' + @current_user.account
    @master_music.save
    redirect_to root_url + 'master', :notice => @master_music.title + 'に投票しました。'     
  end
end
