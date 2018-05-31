module Links
  module Operations
    class Create
      attr_reader :repo, :key_generator

      def initialize(repo: LinkRepository.new, key_generator: Libs::KeyGenerator.new)
        @repo = repo
        @key_generator = key_generator
      end

      def call(payload)
        payload[:key] = key_generator.call
        repo.create(payload)
      end
    end
  end
end