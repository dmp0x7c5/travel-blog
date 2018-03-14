# frozen_string_literal: true

shared_examples "status: 200" do
  it "responds with success status" do
    subject
    expect(response).to have_http_status(:ok)
  end

  it "responds with proper body" do
    subject
    expect(response.body).to eq(response_body.to_json)
  end
end

shared_examples "status: 401" do |message = "You are not authorized to perform this action."|
  it "responds with 401" do
    subject
    expect(response).to have_http_status(:unauthorized)
  end

  it "responds with proper body" do
    subject
    response_body = {
      errors: [
        {
          title: message,
          status: 401,
        },
      ],
    }.to_json
    expect(response.body).to eq(response_body)
  end
end
