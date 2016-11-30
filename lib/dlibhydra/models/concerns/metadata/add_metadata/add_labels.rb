module Dlibhydra
  # add preflabel, title and rdfs_label
  module AddLabels
    extend ActiveSupport::Concern
    include Dlibhydra::SkosLabels,
            Dlibhydra::RdfsLabel,
            Dlibhydra::DcTitle,
            Dlibhydra::ValidateLabel

    # included do
    #   before_save :map_labels
    # end
    #
    # # If there is a preflabel, keep it.
    # #   Otherwise, assign the first title.
    # def map_labels
    #   if preflabel.is_a?(String)
    #     assign_title
    #   elsif preflabel.nil? && title[0].is_a?(String)
    #     assign_preflabel
    #   end
    #   assign_rdfs_label
    # end
    #
    # def assign_rdfs_label
    #   self.rdfs_label = preflabel
    # end
    #
    # def assign_title
    #   if title == [] || title.nil?
    #     self.title = [preflabel]
    #   else
    #     title << preflabel
    #   end
    # end
    #
    # def assign_preflabel
    #   self.preflabel = title[0]
    # end
  end
end
