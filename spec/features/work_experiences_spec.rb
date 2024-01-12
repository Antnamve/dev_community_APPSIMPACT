require 'rails_helper'

RSpec.feature "WorkExperiences", type: :feature do
  describe 'work experiences' do
    describe 'current user' do
      before :each do
        @user = create(:user)
        sign_in(@user)
        sleep 1
      end

      it 'should open work experience form and display the validation errors if empty form is submitted' do
        visit "/member/#{@user.id}"

        expect(page).to have_text('Work Experiences')

        find('a[data-controller="bs-modal-form"] i.bi.bi-plus').click
        sleep 1

        expect(page).to have_text('Add new work experience')
        click_button 'Save Changes'
        sleep 5

        expect(page).to have_text('9 errors prohibited your work experience from being saved.')
        sleep 2
      end

      it 'should open the work experience form and save to db if all validations passed' do
        visit "/member/#{@user.id}"

        expect(page).to have_text('Work Experiences')

        find('a[data-controller="bs-modal-form"] i.bi.bi-plus').click
        sleep 1

        expect(page).to have_text('Add new work experience')

        fill_in 'work_experience_job_title', with: 'Senior Ruby on Rails developer'
        fill_in 'work_experience_company', with: 'Developer Community PVT LTD'
        select 'Full-time', from: 'work_experience_employment_type'
        fill_in 'work_experience_location', with: 'Moscow, Russia'
        select 'Remote', from: 'work_experience_location_type'
        fill_in 'work_experience_start_date', with: '2018-10-01'
        fill_in 'work_experience_end_date', with: '2020-11-12'
        fill_in 'work_experience_description', with: 'Test description'
        click_button 'Save Changes'
        visit "/member/#{@user.id}"

        expect(page).to have_text('Senior Ruby on Rails developer')
        expect(page).to have_text('Developer Community PVT LTD (Full-time)')
        expect(page).to have_text('Moscow, Russia (Remote)')
        sleep 5
      end

    end
  end
end
