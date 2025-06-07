-- Tabela de membros da equipe
CREATE TABLE team_members (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  role VARCHAR(255) NOT NULL,
  description TEXT,
  photo_url VARCHAR(500),
  linkedin_url VARCHAR(500),
  github_url VARCHAR(500),
  instagram_url VARCHAR(500),
  order_position INTEGER DEFAULT 0,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Tabela de documentos
CREATE TABLE documents (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  title VARCHAR(500) NOT NULL,
  description TEXT,
  category VARCHAR(100) NOT NULL,
  file_url VARCHAR(500) NOT NULL,
  file_size VARCHAR(50),
  pages INTEGER,
  tags TEXT[], -- Array de tags
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Tabela de aplicativos
CREATE TABLE applications (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  name VARCHAR(500) NOT NULL,
  description TEXT NOT NULL,
  version VARCHAR(50) NOT NULL,
  icon VARCHAR(10) DEFAULT '📱',
  download_url VARCHAR(500) NOT NULL,
  size VARCHAR(50) NOT NULL,
  category VARCHAR(100) NOT NULL,
  features TEXT[], -- Array de features
  requirements JSONB, -- JSON com os requisitos
  installation_steps TEXT[], -- Array de passos de instalação
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Tabela de usuários admin
CREATE TABLE admin_users (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  email VARCHAR(255) UNIQUE NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  name VARCHAR(255) NOT NULL,
  role VARCHAR(50) DEFAULT 'admin',
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  last_login TIMESTAMP WITH TIME ZONE
);

-- Inserir membros iniciais
INSERT INTO team_members (name, role, description, photo_url, linkedin_url, github_url, instagram_url, order_position) VALUES
('Ana Silva', 'Tech Lead & Full Stack Developer', 'Especialista em React e Node.js, lidera o desenvolvimento de aplicações web modernas para o setor público. Responsável pela arquitetura e implementação dos principais sistemas do LTD.', '/team/ana-silva.jpg', 'https://linkedin.com/in/ana-silva', 'https://github.com/ana-silva', 'https://instagram.com/ana.silva.dev', 1),
('Carlos Santos', 'Especialista em Cibersegurança', 'Expert em segurança da informação com certificações em ethical hacking. Desenvolve ferramentas de proteção e treinamentos de conscientização para as prefeituras parceiras.', '/team/carlos-santos.jpg', 'https://linkedin.com/in/carlos-santos', 'https://github.com/carlos-santos', 'https://instagram.com/carlos.cyber', 2),
('Maria Oliveira', 'Cientista de Dados & IA', 'Especialista em Machine Learning e análise de dados governamentais. Desenvolve algoritmos inteligentes para otimização de processos públicos e análise preditiva.', '/team/maria-oliveira.jpg', 'https://linkedin.com/in/maria-oliveira', 'https://github.com/maria-oliveira', 'https://instagram.com/maria.ai', 3),
('João Costa', 'DevOps Engineer', 'Responsável pela infraestrutura em nuvem e automação de deployments. Garante a escalabilidade e confiabilidade dos sistemas desenvolvidos pelo laboratório.', '/team/joao-costa.jpg', 'https://linkedin.com/in/joao-costa', 'https://github.com/joao-costa', 'https://instagram.com/joao.devops', 4),
('Lucia Fernandes', 'UX/UI Designer', 'Designer focada em experiência do usuário para o setor público. Cria interfaces intuitivas e acessíveis que facilitam a interação dos cidadãos com os serviços digitais.', '/team/lucia-fernandes.jpg', 'https://linkedin.com/in/lucia-fernandes', 'https://github.com/lucia-fernandes', 'https://instagram.com/lucia.design', 5),
('Rafael Almeida', 'Mobile Developer', 'Desenvolvedor especializado em aplicações móveis nativas e híbridas. Responsável pela criação de apps que levam os serviços públicos para os smartphones dos cidadãos.', '/team/rafael-almeida.jpg', 'https://linkedin.com/in/rafael-almeida', 'https://github.com/rafael-almeida', 'https://instagram.com/rafael.mobile', 6),
('Camila Rodrigues', 'Product Manager', 'Gerente de produtos com foco em soluções governamentais. Coordena o desenvolvimento de features e garante que as necessidades dos usuários finais sejam atendidas.', '/team/camila-rodrigues.jpg', 'https://linkedin.com/in/camila-rodrigues', 'https://github.com/camila-rodrigues', 'https://instagram.com/camila.pm', 7);

-- Habilitar RLS (Row Level Security)
ALTER TABLE team_members ENABLE ROW LEVEL SECURITY;
ALTER TABLE documents ENABLE ROW LEVEL SECURITY;
ALTER TABLE applications ENABLE ROW LEVEL SECURITY;
ALTER TABLE admin_users ENABLE ROW LEVEL SECURITY;

-- Políticas de segurança (permitir leitura pública, escrita apenas para admins)
CREATE POLICY "Allow public read access" ON team_members FOR SELECT USING (true);
CREATE POLICY "Allow public read access" ON documents FOR SELECT USING (true);
CREATE POLICY "Allow public read access" ON applications FOR SELECT USING (true);