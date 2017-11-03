module ApplicationHelper
  def datatable_language
    if I18n.exists?('table_text.sInfoFiltered')
      {
          :sProcessing => t('table_text.sProcessing'),
          :sLengthMenu => t('table_text.sLengthMenu'),
          :sZeroRecords => t('table_text.sZeroRecords'),
          :sEmptyTable => t('table_text.sEmptyTable'),
          :sInfo => t('table_text.sInfo'),
          :sInfoEmpty => t('table_text.sInfoEmpty'),
          :sInfoFiltered => t('table_text.sInfoFiltered'),
          :sInfoPostFix => t('table_text.sInfoPostFix'),
          :sSearch => t('table_text.sSearch'),
          :sUrl => t('table_text.sUrl'),
          :sInfoThousands => t('table_text.sInfoThousands'),
          :sLoadingRecords => t('table_text.sLoadingRecords'),
          :oPaginate => {
              :sFirst => t('table_text.sFirst'),
              :sLast => t('table_text.sLast'),
              :sNext => t('table_text.sNext'),
              :sPrevious => t('table_text.sPrevious')
          },
          :oAria => {
              :sSortAscending => t('table_text.sSortAscending'),
              :sSortDescending => t('table_text.sSortDescending')
          }
      }.to_json.html_safe
    end
  end

end
