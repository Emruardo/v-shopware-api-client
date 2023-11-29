module shopwareac

const accept_all = '*/*'
const default_content_type = 'application/json'

struct LoginShop {
	grant_type    string = 'client_credentials'
	client_id     string
	client_secret string
}

pub struct Login {
mut:
	token AuthToken
pub:
	client_id     string
	client_secret string
pub mut:
	api_url string
}

struct AuthToken {
mut:
	access_token string
	expires_in   int
	request_at   i64
	valid_until  i64
}

struct ShopResponseFind {
	meta ShopResponseMeta
pub:
	data []ShopResponseData
}

struct ShopResponse {
pub:
	errors []ErrorDetail
	data   []ShopResponseData
	d      ShopResponseData   @[json: data]
	meta   ShopResponseMeta
}

struct ShopResponseSingle {
pub:
	data ShopResponseData
}

struct ShopResponseError {
	errors []ErrorDetail
}

struct ShopResponseSyncError {
	errors []SyncErrorDetail
}

pub struct ShopResponseData {
pub:
	id         string
	attributes Attributes
}

pub struct Attributes {
pub:
	media_id               string            @[json: mediaId]
	cover_id               string            @[json: coverId]
	child_count            int               @[json: childCount]
	stock                  int
	custom_fields          map[string]string @[json: customFields]
	active                 bool
	product_number         string            @[json: productNumber]
	custom_search_keywords []string          @[json: customSearchKeywords]
	payment_method_id      string            @[json: paymentMethodId]
	name                   string
	parent_id              string            @[json: parentId]
	cms_page_id            string            @[json: cmsPageId]
}

struct ErrorDetail {
	status string
	code   string
	detail string
	title  string
}

struct SyncErrorDetail {
	status string
	code   string
	detail string
	title  string
	// source map[string]string
	source ErrorDetailSource
	meta   SyncErrorDetailMeta
}

struct SyncErrorDetailMeta {
	parameters map[string]string
}

struct ErrorDetailSource {
	pointer string
}

struct ShopResponseMeta {
	total int
}

struct SyncPayload {
	payload []map[string]string
}

pub struct Category {
pub mut:
	id          string
	name        string @[omitempty]
	parent_id   string @[json: parentId; omitempty]
	cms_page_id string @[json: cmsPageId]
	active      ?bool
}

pub struct Manufacturer {
pub mut:
	id          string
	name        string @[omitempty]
	link        string @[omitempty]
	description string @[omitempty]
	media       Media  @[omitempty]
}

pub struct Unit {
pub mut:
	id         string
	name       string @[omitempty]
	short_code string @[json: 'shortCode'; omitempty]
}

pub struct Product {
pub mut:
	id                     string
	name                   string                @[omitempty]
	stock                  ?int                  @[omitempty]
	product_number         string                @[json: 'productNumber'; omitempty]
	description            string                @[omitempty]
	manufacturer           Id                    @[omitempty]
	categories             []Id                  @[omitempty]
	visibilities           []Visibility          @[omitempty]
	tax_id                 string                @[json: 'taxId'; omitempty]
	keywords               string                @[omitempty]
	custom_search_keywords []string              @[json: 'customSearchKeywords'; omitempty]
	options                []Option_             @[omitempty]
	weight                 int                   @[omitempty]
	price                  []Price               @[omitempty]
	cover_id               string                @[json: 'coverId'; omitempty]
	unit_id                string                @[json: 'unitId'; omitempty]
	media                  []ProductMedia        @[omitempty]
	custom_fields          CustomField           @[json: 'customFields'; omitempty]
	ean                    string                @[omitempty]
	meta_title             string                @[json: 'metaTitle'; omitempty]
	meta_description       string                @[json: 'metaDescription'; omitempty]
	parent_id              string                @[json: 'parentId'; omitempty]
	reference_unit         f64                   @[json: 'referenceUnit'; omitempty]
	purchase_unit          f64                   @[json: 'purchaseUnit'; omitempty]
	max_purchase           int                   @[json: 'maxPurchase'; omitempty]
	configurator_settings  []ConfiguratorSetting @[json: 'configuratorSettings'; omitempty]
}

pub struct ConfiguratorSetting {
pub mut:
	id        string @[omitempty]
	option_id string @[json: 'optionId'; omitempty]
}

pub struct ProductMedia {
pub mut:
	id       string
	position int
	media    Media
}

pub struct Id {
pub mut:
	id string @[omitempty]
}

pub struct Visibility {
pub mut:
	id               string @[omitempty]
	sales_channel_id string @[json: 'salesChannelId'; omitempty]
	visibility       int = 30    @[omitempty]
}

pub struct Option_ { // Option is a reserved word
pub mut:
	id       string @[omitempty]
	name     string @[omitempty]
	group_id string @[json: 'groupId'; omitempty]
}

pub struct Price {
pub mut:
	net         f64
	gross       f64
	currency_id string = 'b7d2554b0ce847cd82f3ac9bd1c0dfca' @[json: 'currencyId']
	linked      bool = true
}

pub struct Media {
pub:
	id              string @[omitempty]
	media_folder_id string @[json: 'mediaFolderId'; omitempty]
}

pub struct Tax {
pub mut:
	id       string @[omitempty]
	name     string @[omitempty]
	tax_rate ?f64   @[json: 'taxRate'; omitempty]
}

pub struct PropertyGroup {
pub mut:
	id   string @[omitempty]
	name string @[omitempty]
}

pub struct CustomField {
pub mut:
	custom_import_field1 string @[omitempty]
	custom_import_field2 string @[omitempty]
	custom_import_field3 string @[omitempty]
	custom_import_field4 string @[omitempty]
	custom_import_field5 string @[omitempty]
	custom_import_field6 string @[omitempty]
	custom_import_field7 string @[omitempty]
	custom_import_field8 string @[omitempty]
	custom_import_field9 string @[omitempty]
}
