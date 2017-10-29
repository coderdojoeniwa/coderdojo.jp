# -*- coding: utf-8 -*-
class ScrivitoController < ApplicationController
  include Scrivito::ControllerActions

  # TODO: There may be smarter detection
  USING_SCRIVITO = true

  title ||= ENV['SCRIVITO_WORKSPACE'] || 'DEFAULT_WORKSPACE'
  Scrivito::Workspace.create(title: title) unless Scrivito::Workspace.find_by_title(title)
  Scrivito::Workspace.use(title)

  LoginPage.create(title: 'ログイン')
end
