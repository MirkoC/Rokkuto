Swagger::Docs::Config.register_apis ({
    '1.0' => {
        # the extension used for the API
        :api_extension_type => :json,
        # the output location where your .json files are written to
        :api_file_path => 'public/api/v1/',
        # the URL base path to your API
        :base_path => 'http://rokkuto.com/',
        # if you want to delete all .json files at each generation
        :clean_directory => true,
        # add custom attributes to api-docs
        :attributes => {
            :info => {
                'title' => 'Rokkuto app',
                'description' => 'Simple auth app with feature for authorizing components.',
                'termsOfServiceUrl' => 'https://github.com/MirkoC/rokkuto/blob/master/README.rdoc',
                'contact' => 'mirko@floatingpoint.com',
                'license' => 'The MIT License',
                'licenseUrl' => 'https://github.com/MirkoC/rokkuto/blob/master/LICENSE'
            }
        }
    }
})