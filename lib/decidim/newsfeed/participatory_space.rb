# frozen_string_literal: true

Decidim.register_participatory_space(:newsfeed) do |participatory_space|
  participatory_space.context(:public) do |ctx|
    ctx.engine = Decidim::Newsfeed::Engine
  end
  participatory_space.context(:admin) do |ctx|
    ctx.engine = Decidim::Newsfeed::AdminEngine
  end
  participatory_space.participatory_spaces do |_organization|
    Decidim::ParticipatoryProcess.none
  end
end
